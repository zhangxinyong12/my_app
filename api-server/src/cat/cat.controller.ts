import { Controller, Get } from '@nestjs/common';
import { CatService } from './cat.service';

@Controller('cat')
export class CatController {
    constructor(private readonly catService: CatService) { }

    @Get("add")
    async add() {
        await this.catService.create({
            name: "cat1",
            age: 20
        });
        return {
            code: 200,
            msg: "成功"
        };
    }
}
