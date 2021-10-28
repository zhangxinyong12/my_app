import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Cat } from '../entity/cat/cat.entity';
import { CreateCatDto } from './create-cat-dto';

@Injectable()
export class CatService {
    constructor(
        @InjectRepository(Cat)
        private readonly catRepository: Repository<Cat>,
    ) { }

    // 创建的方法
    async create(createCatDto: CreateCatDto): Promise<Cat> {
        return await this.catRepository.save(createCatDto);
    }

    findAll() {
        return this.catRepository.find();
    }
}
