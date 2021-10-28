"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.CatController = void 0;
const common_1 = require("@nestjs/common");
const cat_service_1 = require("./cat.service");
let CatController = class CatController {
    constructor(catService) {
        this.catService = catService;
    }
    async add() {
        await this.catService.create({
            name: 'cat',
            age: 20,
        });
        return {
            code: 200,
            msg: '成功',
        };
    }
    async find() {
        return this.catService.findAll();
    }
    update() {
        return this.catService.update();
    }
    remove() {
        return this.catService.remove();
    }
};
__decorate([
    (0, common_1.Get)('add'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], CatController.prototype, "add", null);
__decorate([
    (0, common_1.Get)('find'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], CatController.prototype, "find", null);
__decorate([
    (0, common_1.Get)("update"),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], CatController.prototype, "update", null);
__decorate([
    (0, common_1.Post)("remove"),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], CatController.prototype, "remove", null);
CatController = __decorate([
    (0, common_1.Controller)('cat'),
    __metadata("design:paramtypes", [cat_service_1.CatService])
], CatController);
exports.CatController = CatController;
//# sourceMappingURL=cat.controller.js.map