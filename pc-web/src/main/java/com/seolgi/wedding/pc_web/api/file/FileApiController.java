package com.seolgi.wedding.pc_web.api.file;

import com.seolgi.wedding.pc_web.util.FileAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("/api/file/")
public class FileApiController {

    @Autowired
    private FileAdapter fileAdapter;

    @PostMapping(value = "image")
    public ResponseEntity<UploadFile> uploadImage(@RequestParam MultipartFile image) throws IOException {
        return ResponseEntity.ok(UploadFile.create(fileAdapter.uploadFile(image)));
    }
}
