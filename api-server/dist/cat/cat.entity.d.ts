import { Timestamp } from 'typeorm';
export declare class CatEntity {
    id: number;
    uuid: string;
    name: string;
    age: number;
    color: string;
    createAt: Timestamp;
    updateAt: Timestamp;
}
