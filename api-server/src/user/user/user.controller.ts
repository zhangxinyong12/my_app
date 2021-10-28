import { Body, Controller, Param, Post, UploadedFile, UseInterceptors } from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { UserService } from './user.service';

@Controller('app/user')
export class UserController {
    constructor(private readonly uerService: UserService) { }

    // Content-Type application/x-www-form-urlencoded  application/json
    @Post("registration")
    registration(@Body() body) {
        console.log(body);
        return JSON.stringify({ body });
    }
    // Content-Type form-data
    @Post("login")
    @UseInterceptors(FileInterceptor('file')) // file对应HTML表单的name属性
    login(@Body() body, @UploadedFile() file) {
        // console.log(file);
        return JSON.stringify({ body });
    }
}
