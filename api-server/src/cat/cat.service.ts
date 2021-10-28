import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Cat } from '../entity/cat/cat.entity';
import { CreateCatDto } from './create-cat-dto';
/**
 * userRepository.find({
        select: ["firstName", "lastName"],
        relations: ["profile", "photos", "videos"],
        where: {
            firstName: "Timber",
            lastName: "Saw"
        },
        order: {
            name: "ASC",
            id: "DESC"
        },
        skip: 5,
        take: 10,
        cache: true
    });
 * 
 */
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

    update() {
        return this.catRepository.update({ name: "cat" }, { name: "cat2", age: 30 });
    }

    async remove() {
        const data = await this.catRepository.findOne({ name: 'cat2' });
        console.log(data);
        if (data) {
            return this.catRepository.delete(data);
        }
        return [];
    }
}
