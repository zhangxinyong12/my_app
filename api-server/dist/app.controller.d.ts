import { AppService } from './app.service';
export declare class AppController {
    private readonly appService;
    constructor(appService: AppService);
    testApi(query: any, hader: any, response: any): any;
    getHello(param: any): string;
}
