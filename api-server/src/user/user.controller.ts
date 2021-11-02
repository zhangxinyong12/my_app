import { Body, Controller, Header, Param, Post, Response, UploadedFile, UseInterceptors, Headers } from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { UserService } from './user.service';

@Controller('user')
export class UserController {
    constructor(private readonly uerService: UserService) { }

    // Content-Type application/x-www-form-urlencoded  application/json
    @Post("register")
    async register(@Body() body, @Response() res, @Headers() headers) {
        console.log(body, headers);
        const { name, pwd, phone, age } = body;
        const data = await this.uerService.register(name, pwd, phone, age * 1);
        return res.json(data);

    }
    // // Content-Type form-data
    // @Post("login")
    // @UseInterceptors(FileInterceptor('file')) // file对应HTML表单的name属性
    // login(@Body() body, @UploadedFile() file, @Response() res) {

    // }

    @Post("login")
    async login(@Body() body, @Response() res) {
        const { name, pwd } = body;
        const data = await this.uerService.login(name, pwd);

        if (data) {
            return res.json({
                code: 200, success: true,
                message: "登录成功", data: { id: data.id, name: data.name, uuid: data.uuid }
            });
        } else {
            return res.json({ code: 200, success: false, message: "用户名或者密码错误" });
        }
    }
}
