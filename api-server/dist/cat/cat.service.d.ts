import { Repository } from 'typeorm';
import { Cat } from '../entity/cat/cat.entity';
import { CreateCatDto } from './create-cat-dto';
export declare class CatService {
    private readonly catRepository;
    constructor(catRepository: Repository<Cat>);
    create(createCatDto: CreateCatDto): Promise<Cat>;
    findAll(): Promise<Cat[]>;
    update(): Promise<import("typeorm").UpdateResult>;
    remove(): Promise<any[] | import("typeorm").DeleteResult>;
}
