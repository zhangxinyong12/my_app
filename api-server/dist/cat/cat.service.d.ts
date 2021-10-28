import { Repository } from 'typeorm';
import { CatEntity } from './cat.entity';
import { CreateCatDto } from './create-cat-dto';
export declare class CatService {
    private readonly catRepository;
    constructor(catRepository: Repository<CatEntity>);
    create(createCatDto: CreateCatDto): Promise<CatEntity>;
    findAll(): Promise<CatEntity[]>;
}
