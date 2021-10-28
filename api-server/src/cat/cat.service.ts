import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CatEntity } from './cat.entity';
import { CreateCatDto } from './create-cat-dto';

@Injectable()
export class CatService {
    constructor(
        @InjectRepository(CatEntity)
        private readonly catRepository: Repository<CatEntity>,
    ) { }

    // 创建的方法
    async create(createCatDto: CreateCatDto): Promise<CatEntity> {
        return await this.catRepository.save(createCatDto);
    }

    findAll() {
        return this.catRepository.find();
    }
}