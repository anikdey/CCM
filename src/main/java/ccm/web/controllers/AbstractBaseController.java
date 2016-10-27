package ccm.web.controllers;

import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.util.UUID;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


public class AbstractBaseController {
    public String multipartImageFileHandler(MultipartHttpServletRequest request, String col) {
        
        MultipartFile multipartFile = request.getFile(col);
        
        if (multipartFile != null && multipartFile.getSize() > 0) {
            
            try {
                
                String contentType = multipartFile.getContentType();
                String extension = "jpg";
                if (contentType.contains("jpeg")) {
                    extension = "jpg";
                } else if (contentType.contains("png")) {
                    extension = "png";
                } else if (contentType.contains("gif")) {
                    extension = "gif";
                }
                
                String randomName = UUID.randomUUID().toString();
                String fileCaption = randomName + "." + extension;
                String parent = getOuterParentPath(request);
                
                File file = new File(parent + File.separator + "uploads" + File.separator + "pics" + File.separator + fileCaption);
                File filet = new File(parent + File.separator + "uploads" + File.separator + "tumb_pics" + File.separator + fileCaption);

                if (!filet.getParentFile().exists()) {
                    filet.getParentFile().mkdirs();
                }
                
                FileUtils.writeByteArrayToFile(file, multipartFile.getBytes());
                BufferedImage bsrc = ImageIO.read(multipartFile.getInputStream());
                BufferedImage bdest = new BufferedImage(45, 55, BufferedImage.TYPE_INT_RGB);
                Graphics2D g = bdest.createGraphics();
                AffineTransform at = AffineTransform.getScaleInstance((double) 45 / bsrc.getWidth(), (double) 55 / bsrc.getHeight());
                g.drawRenderedImage(bsrc, at);
                ImageIO.write(bdest, extension, filet);
                
                System.out.println("Upladed to directory :  " + file.toString());
                return fileCaption;
            } catch (Exception exception) {
                exception.printStackTrace();
            }
        }
        return "";
    }
    
    protected String getOuterParentPath(HttpServletRequest request) {
        File root = new File(request.getServletContext().getRealPath("/"));
        File rootUp = new File(root.getParentFile() + File.separator + root.getName() + "_repo");
        return rootUp.toString();
    }
    
    
    @RequestMapping(value = "/getFile/{code}.{ext}", method = RequestMethod.GET)
    public @ResponseBody
    ResponseEntity<byte[]> getFile(@PathVariable("code") String code, @PathVariable("ext") String ext, HttpServletRequest request) {
        System.out.println("finding getFile: code: " + code + " ext: " + ext);
        return getFile(request, "files", code, ext);
    }

    @RequestMapping(value = "/getPhoto/{code}.{format}", method = RequestMethod.GET)
    public @ResponseBody
    ResponseEntity<byte[]> getPhoto(@PathVariable("code") String code, @PathVariable("format") String format, HttpServletRequest request) {
        System.out.println("finding getPhoto: code: " + code + " format: " + format);
        return getImage(request, "pics", code, format);
    }

    @RequestMapping(value = "/getPhotoTumb/{code}.{format}", method = RequestMethod.GET)
    public @ResponseBody
    ResponseEntity<byte[]> getPhotoSmall(@PathVariable("code") String code, @PathVariable("format") String format, HttpServletRequest request) {
        System.out.println("finding getPhotoSmall: code: " + code + " format: " + format);
        return getImage(request, "tumb_pics", code, format);
    }

    ResponseEntity<byte[]> getFile(HttpServletRequest request, String dir, String code, String ext) {
        try {
            String parent = getOuterParentPath(request);
            File file = new File(parent + "\\uploads\\" + dir + "\\" + code + "." + ext);

            byte[] buf = IOUtils.toByteArray(new FileInputStream(file));
            System.out.println("size file: " + buf.length);
            return new ResponseEntity<byte[]>(buf, HttpStatus.CREATED);
        } catch (Exception e) {
            return null;
        }
    }

    ResponseEntity<byte[]> getImage(HttpServletRequest request, String dir, String code, String format) {
        try {
            String parent = getOuterParentPath(request);
            File file = new File(parent + "\\uploads\\" + dir + "\\" + code + "." + format);

            byte[] buf = IOUtils.toByteArray(new FileInputStream(file));
            System.out.println("size file: " + buf.length);
            final HttpHeaders headers = new HttpHeaders();
            if (format.toLowerCase().contains("jpg")) {
                headers.setContentType(MediaType.IMAGE_JPEG);
            } else if (format.toLowerCase().contains("gif")) {
                headers.setContentType(MediaType.IMAGE_GIF);
            } else if (format.toLowerCase().contains("png")) {
                headers.setContentType(MediaType.IMAGE_PNG);
            }
            return new ResponseEntity<byte[]>(buf, headers, HttpStatus.CREATED);
        } catch (Exception ex) {
            return null;
        }
    }
    
    
}
