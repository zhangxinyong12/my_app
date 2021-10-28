import { Repository } from 'typeorm';
import { User } from '../entity/user/user.entity';
export declare class UserService {
    private readonly user;
    constructor(user: Repository<User>);
    login(): void;
}
