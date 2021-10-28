import { UserService } from './user.service';
export declare class UserController {
    private readonly uerService;
    constructor(uerService: UserService);
    registration(body: any): string;
    login(body: any, file: any): string;
}
