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

    async register(name, pwd, phone?, age?) {
        const data = await this.userRepository.findOne({ name });
        if (data) {
            return { code: 200, success: false, message: "用户名重复" };
        } else {
            try {
                await this.userRepository.save({ name, pwd, phone, age });
                return { code: 200, success: true, message: "注册成功" };

            } catch (error) {
                return { code: 200, success: false, message: error };
            }
        }
    }
}
