import Mag from '../../entities/Mag';

const getMagazines = (): Promise<Mag[]> => {
  return Mag.find();
};

const getMagazineByMagazineId = (magazineId: number): Promise<Mag | undefined> => {
  return Mag.findOne(magazineId, { relations: ['tracks'] });
};

export { getMagazines, getMagazineByMagazineId };
