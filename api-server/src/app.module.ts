import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './user/user.module';
// 引入数据库的及配置文件
import { TypeOrmModule, TypeOrmModuleOptions } from '@nestjs/typeorm';
import { CatModule } from './cat/cat.module';

const ormconfig: TypeOrmModuleOptions = {
  type: 'mysql',
  host: 'rm-wz9i6arsb4631oj1e2o.mysql.rds.aliyuncs.com',
  port: 3306,
  username: 'zhang2',
  password: 'WOziji123456',
  database: 'app_flutter',
  entities: ['dist/**/*.entity{.ts,.js}'],
  timezone: 'UTC',
  charset: 'utf8mb4',
  multipleStatements: true,
  dropSchema: false,
  synchronize: true, // 会自动同步创建数据库修改表结构 慎用
  logging: true,
  // autoLoadEntities: true,
};
@Module({
  imports: [
    TypeOrmModule.forRoot({ ...ormconfig }),
    UserModule,
    CatModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
