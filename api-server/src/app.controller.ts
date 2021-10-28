import { Controller, Get, Param, Query, Headers } from '@nestjs/common';
import { AppService } from './app.service';

@Controller("app")
export class AppController {
  constructor(private readonly appService: AppService) { }


  // 参考 https://blog.csdn.net/lxy869718069/article/details/103421208
  // ?后面参数
  @Get("api")
  testApi(@Query() query, @Headers() hader): string {
    return JSON.stringify({ query, hader });
  }

  // 路径上参数
  @Get(":id")
  getHello(@Param() param): string {
    return param;
  }
}
