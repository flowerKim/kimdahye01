package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
  private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
  
  @RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
  public void uploadForm(MultipartFile file, Model model) throws Exception {
    logger.info("originalName: " + file.getOriginalFilename());
    logger.info("size: " + file.getSize());
    logger.info("contentType: " + file.getContentType());
  }
}