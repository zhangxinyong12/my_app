import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './user/user/user.module';
// 引入数据库的及配置文件
import { TypeOrmModule, TypeOrmModuleOptions } from '@nestjs/typeorm';
import { CatModule } from './cat/cat.module';

@Module({
  imports: [
    TypeOrmModule.forRoot(),
    UserModule, CatModule, // 数据库的
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
