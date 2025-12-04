export const WEAPON_IDS: Record<number, string> = {
  // Small Swords
  1003: 'Faith',
  1013: 'Iron Pipe',
  1020: 'Beastbane',
  1030: 'Ancient Overlord',
  1040: 'Phoenix Dagger',
  1050: 'Type-4O Sword',
  1060: 'Type-3 Sword',
  1070: 'Virtuous Contract',
  1071: 'Cruel Oath',
  1080: 'YoRHa-issue Blade',
  1090: 'Machine Sword',
  1100: 'Cypress Stick',
  1101: 'Engine Blade',

  // Large Swords
  1203: 'Iron Will',
  1213: 'Fang of the Twins',
  1220: 'Beastlord',
  1230: 'Phoenix Sword',
  1240: 'Type-4O Blade',
  1250: 'Type-3 Blade',
  1260: 'Virtuous Treaty',
  1261: 'Cruel Blood Oath',
  1270: 'Machine Axe',

  // Spears
  1400: 'Phoenix Lance',
  1420: 'Beastcurse',
  1430: 'Dragoon Lance',
  1440: 'Spear of the Usurper',
  1450: 'Type-4O Lance',
  1460: 'Type-3 Lance',
  1470: 'Virtuous Dignity',
  1471: 'Cruel Arrogance',
  1480: 'Machine Spear',

  // Combat Bracers
  1600: 'Type-3 Fists',
  1610: 'Type-4O Fists',
  1620: 'Virtuous Grief',
  1621: 'Cruel Lament',
  1630: "Demon's Cry",
  1640: "Angel's Folly",
  1650: 'Machine Heads',
  1875: 'Emil Heads',
  1877: 'Emil Heads', // Keeping both just in case
}

export const POD_PROGRAM_IDS: Record<number, string> = {
  2001: 'R010: Laser',
  2002: 'R020: Mirage',
  2003: 'R030: Hammer',
  2004: 'R040: Blade',
  2005: 'R050: Spear',
  2006: 'R070: M Shield',
  2007: 'A060: P Shield',
  2008: 'A080: Wave',
  2009: 'A090: Wire',
  2010: 'A100: Decoy',
  2011: 'A110: Slow',
  2012: 'A120: Repair',
  2015: 'A130: Bomb',
  2019: 'A140: Gravity',
  2021: 'A150: Volt',
  2022: 'A160: Missile',
  2024: 'A170: Scanner',
}

export const FISH_IDS: Record<number, string> = {
  8001: 'Arowana',
  8002: 'Twinfish',
  8003: 'Killifish',
  8004: 'Carp',
  8005: 'Bloat Fish',
  8006: 'Koi Carp',
  8007: 'Fur Carp',
  8008: 'Freshwater Ray',
  8009: 'Arapaima',
  8010: 'Oil Sardine',
  8011: 'Water Flea',
  8012: 'Twoface',
  8013: 'Coelacanth',
  8014: 'Blowfish',
  8015: 'Swordfish',
  8016: 'Mackerel',
  8017: 'Horseshoe Crab',
  8018: 'Beetle Fish',
  8019: 'Starfish',
  8020: 'Bream',
  8021: 'Basking Shark',
  8022: 'Killifish Machine',
  8023: 'Koi Carp Machine',
  8024: 'Arapaima Machine',
  8025: 'Carp Machine',
  8026: 'Bloat Fish Machine',
  8027: 'Blowfish Machine',
  8028: 'Swordfish Machine',
  8029: 'Starfish Machine',
  8030: 'Bream Machine',
  8031: 'Coelacanth Machine',
  8032: 'Mackerel Machine',
  8033: 'Horseshoe Crab Machine',
  8034: 'Arowana Machine',
  8035: 'Basking Shark Machine',
  8036: 'Freshwater Ray Machine',
  8037: 'Machine Lifeform Head',
  8038: 'Tire',
  8039: 'Gas Cylinder',
  8040: 'Battery',
  8041: 'Broken Firearm',
}

export const NIER_ITEM_IDS: Record<number, string> = {
  ...WEAPON_IDS,
  ...POD_PROGRAM_IDS,
  ...FISH_IDS,
}

// Helper to normalize names for matching with DB
export const normalizeName = (name: string) => {
  return name.toLowerCase().replace(/[^a-z0-9]/g, '')
}
