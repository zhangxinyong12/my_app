import { Controller, Get } from '@nestjs/common';
import { GoodsService } from './goods.service';

@Controller('goods')
export class GoodsController {
    constructor(private readonly goodsService: GoodsService) { }

    @Get()
    getList() {
        return this.goodsService.getList();
    }
}
