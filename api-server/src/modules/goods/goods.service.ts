import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Goods } from './entity/goods.entity';
import { Repository } from 'typeorm';

@Injectable()
export class GoodsService {
    constructor(
        @InjectRepository(Goods)
        private goodsRepository: Repository<Goods>,
    ) { }
    getList() {
        return this.goodsRepository.find();
    }
}
