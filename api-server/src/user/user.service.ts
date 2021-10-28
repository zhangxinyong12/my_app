import { Injectable, } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from '../entity/user/user.entity';

@Injectable()
export class UserService {
    constructor(
        @InjectRepository(User)
        private readonly userRepository: Repository<User>,
    ) { }

    async login(name, pwd) {
        const data = await this.userRepository.findOne({ name, pwd });
        if (data) {
            return true;
        } else {
            return false;
        }
    }

    async register(name, pwd) {
        const data = await this.userRepository.findOne({ name });
        console.log('reg data');
        console.log(data);
        if (data) {
            return { code: 200, success: false, msg: "用户名重复" };
        } else {
            try {
                await this.userRepository.save({ name, pwd });
                return { code: 200, success: true, msg: "注册成功" };

            } catch (error) {
                console.log('-----------------------', error);
                return { code: 200, success: false, msg: error };
            }
        }
    }
}
