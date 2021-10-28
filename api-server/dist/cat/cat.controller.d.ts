import { CatService } from './cat.service';
export declare class CatController {
    private readonly catService;
    constructor(catService: CatService);
    add(): Promise<{
        code: number;
        msg: string;
    }>;
    find(): Promise<import("../entity/cat/cat.entity").Cat[]>;
    update(): Promise<import("typeorm").UpdateResult>;
    remove(): Promise<any[] | import("typeorm").DeleteResult>;
}
