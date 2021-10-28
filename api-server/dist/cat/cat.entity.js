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
exports.CatEntity = void 0;
const typeorm_1 = require("typeorm");
let CatEntity = class CatEntity {
};
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)({ comment: '主键id' }),
    __metadata("design:type", Number)
], CatEntity.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ length: 100, comment: 'uuid', generated: 'uuid' }),
    __metadata("design:type", String)
], CatEntity.prototype, "uuid", void 0);
__decorate([
    (0, typeorm_1.Column)({ length: 50, comment: '名字', unique: true }),
    __metadata("design:type", String)
], CatEntity.prototype, "name", void 0);
__decorate([
    (0, typeorm_1.Column)({ comment: '年龄' }),
    __metadata("design:type", Number)
], CatEntity.prototype, "age", void 0);
__decorate([
    (0, typeorm_1.Column)({
        type: 'varchar',
        length: 30,
        comment: '颜色',
        nullable: true,
    }),
    __metadata("design:type", String)
], CatEntity.prototype, "color", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'timestamp', default: () => 'current_timestamp' }),
    __metadata("design:type", typeorm_1.Timestamp)
], CatEntity.prototype, "createAt", void 0);
__decorate([
    (0, typeorm_1.Column)({
        type: 'timestamp',
        onUpdate: 'current_timestamp',
        default: () => 'current_timestamp',
    }),
    __metadata("design:type", typeorm_1.Timestamp)
], CatEntity.prototype, "updateAt", void 0);
CatEntity = __decorate([
    (0, typeorm_1.Entity)()
], CatEntity);
exports.CatEntity = CatEntity;
//# sourceMappingURL=cat.entity.js.map