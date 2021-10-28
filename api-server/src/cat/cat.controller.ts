import { Controller, Get } from '@nestjs/common';
import { CatService } from './cat.service';

@Controller('cat')
export class CatController {
    constructor(private readonly catService: CatService) { }

    @Get('add')
    async add() {
        await this.catService.create({
            name: 'cat',
            age: 20,
            // id: 1,
        });
        return {
            code: 200,
            msg: '成功',
        };
    }
    @Get('find')
    async find() {
        return this.catService.findAll();
    }
}
