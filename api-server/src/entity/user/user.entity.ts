/* eslint-disable prettier/prettier */
import { Column, Entity, PrimaryGeneratedColumn, Timestamp } from 'typeorm';

@Entity()
export class User {
    // 会以类名来创建表,如果是驼峰命名的,生成的表名是下划线区分
    @PrimaryGeneratedColumn({ comment: '主键id' })
    id: number;

    @Column({ length: 100, comment: 'uuid', generated: 'uuid' })
    uuid: string;

    @Column({ length: 20, comment: '名字', unique: true })
    name: string;

    @Column({ comment: "密码", length: 50 })
    pwd: string;
    // nullable 列非必填
    @Column({ comment: '手机号', nullable: true })
    phone: number | null;

    @Column({ comment: '年龄', nullable: true })
    age: number | null;

    @Column({ type: 'timestamp', default: () => 'current_timestamp' })
    createAt: Timestamp;

    @Column({
        type: 'timestamp',
        onUpdate: 'current_timestamp',
        default: () => 'current_timestamp',
    })
    updateAt: Timestamp;
}
