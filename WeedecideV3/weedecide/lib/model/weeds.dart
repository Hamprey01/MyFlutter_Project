class Weed {
  final String weedName;
  final String localName;
  final String description;
  final String image;
  final List<Herbicide> herbicides;

  Weed({
    required this.weedName,
    required this.localName,
    required this.description,
    required this.image,
    required this.herbicides,
  });
}

class Herbicide {
  final String name;
  final String weedsControlled;
  final String timeofApplication;
  final String rateofApplication;
  final String reminders;

  Herbicide({
    required this.name,
    required this.weedsControlled,
    required this.timeofApplication,
    required this.rateofApplication,
    required this.reminders,
  });
}

List<Weed> weedList = [
  Weed(
    weedName: 'Ageratum conyzoides',
    localName: 'BIllygoat Weed, Pega-Pega',
    description:
        'Ageratum conyzoides (billygoat-weed, chick weed, goatweed, whiteweed, mentrasto) is native to Tropical America, especially Brazil, and is an invasive weed in many other regions. It is an herb that is 0.5–1 m. high, with ovate leaves 2–6 cm long, and flowers are white to mauve.',
    image: 'assets/WeedPic/Ageratum_conyzoides.jpg',
    herbicides: [
      Herbicide(
        name: 'Bensulfuron methyl, Bispyribac sodium',
        weedsControlled: 'broadleaves',
        timeofApplication: '4-8 DAS (Days After Seeding)',
        rateofApplication: '500-700 g/ha',
        reminders:
            'Works best with standing water that should be retained for at least 4 days. Spray volume is 80-160 L/ha.',
      ),
      Herbicide(
          name: 'Bentazon',
          weedsControlled: 'Perennial and annual sedges',
          timeofApplication:
              'weeds at 2 to10-leaf stageweeds at 2 to10-leaf stage',
          rateofApplication: '2.0 L/ha',
          reminders:
              'Apply on saturated soil or reduce water to expose weeds. Spray volume is 500 L/ha.'),
    ],
  ),
  Weed(
    weedName: 'Cyanthillium cinereum',
    localName: 'Little Ironweed',
    description:
        'Cyanthillium cinereum is a species of perennial plants in the sunflower family. The species is native to tropical Africa and to tropical Asia and has become naturalized in Australia, Mesoamerica, tropical South America, the West Indies, and the US State of Florida.',
    image: 'assets/WeedPic/Cyanthillium_cinereum.jpg',
    herbicides: [
      Herbicide(
          name: 'Bispyribac sodium',
          weedsControlled:
              'Annual grasses except L. chinensis, sedges, and broadleaves',
          timeofApplication: '20-35 DAS',
          rateofApplication: '250 ml/ha',
          reminders:
              'Before spraying, drain excess water until the half part of target weeds appears. Re-irrigate within 1-3 days after spraying.'),
      Herbicide(
        name: 'Butachlor (emulsifiable concentrate with safener)',
        weedsControlled: 'Grasses, sedges, and broadleaves',
        timeofApplication: '2-5 DAS',
        rateofApplication: '0.75-1.0 L/ha',
        reminders:
            'Apply on moist and puddled soil. Control water normally after applying without submerging seedlings; spray volume is 200 L/ha.',
      ),
    ],
  ),
  Weed(
    weedName: 'Echinochloa crus-galli',
    localName: 'Cockspur grass',
    description:
        'Echinochloa crus-galli is a type of wild grass originating from tropical Asia that was formerly classified as a type of panicum grass. It is commonly known as cockspur, barnyard millet, Japanese millet, water grass, common barnyard grass, or simply "barnyard grass".',
    image: 'assets/WeedPic/echinochloa_crus-galli.jpg',
    herbicides: [
      Herbicide(
        name: 'Butachlor (emulsifiable concentrate with safener)',
        weedsControlled: 'Grasses, sedges, and broadleaves',
        timeofApplication: '2-5 DAS',
        rateofApplication: '0.75-1.0 L/ha',
        reminders:
            'Apply on moist and puddled soil. Control water normally after applying without submerging seedlings; spray volume is 200 L/ha.',
      ),
    ],
  ),
  Weed(
    weedName: 'Leptochloa chinensis',
    localName: 'Talisay',
    description:
        'Leptochloa chinensis, commonly known as red sprangletop, Asian sprangletop, or Chinese sprangletop, is a species of grass in the family Poaceae. It is a serious weed of rice. It is native to regions of Africa, Asia, and Oceania.',
    image: 'assets/WeedPic/Leptochloa_chinensis.jpg',
    herbicides: [
      Herbicide(
        name: 'Butachlor (emulsifiable concentrate with safener)',
        weedsControlled: 'Grasses, sedges, and broadleaves',
        timeofApplication: '2-5 DAS',
        rateofApplication: '0.75-1.0 L/ha',
        reminders:
            'Apply on moist and puddled soil. Control water normally after applying without submerging seedlings; spray volume is 200 L/ha.',
      ),
      Herbicide(
        name: 'Bispyribac sodium',
        weedsControlled:
            'Annual grasses except L. chinensis, sedges, and broadleaves',
        timeofApplication: '20-35 DAS',
        rateofApplication: '250 ml/ha',
        reminders:
            'Before spraying, drain excess water until the half part of target weeds appears. Re-irrigate within 1-3 days after spraying.',
      ),
    ],
  ),
  Weed(
    weedName: 'Cyperus haspan',
    localName: 'tikod-amakan',
    description:
        'Cyperus haspan is a dwarf papyrus sedge in the Cyperaceae. It is widely distributed in tropical and subtropical regions in Africa, Madagascar, southern Asia, New Guinea, Australia, South America, West Indies, Central America, southern Mexico and the southeastern United States',
    image: 'assets/WeedPic/Cyperus_haspan.jpg',
    herbicides: [
      Herbicide(
          name: 'Bispyribac sodium',
          weedsControlled:
              'Annual grasses except L. chinensis, sedges, and broadleaves',
          timeofApplication: '20-35 DAS',
          rateofApplication: '250 ml/ha',
          reminders:
              'Before spraying, drain excess water until the half part of target weeds appears. Re-irrigate within 1-3 days after spraying.'),
      Herbicide(
        name: 'Butachlor (emulsifiable concentrate with safener)',
        weedsControlled: 'Grasses, sedges, and broadleaves',
        timeofApplication: '2-5 DAS',
        rateofApplication: '0.75-1.0 L/ha',
        reminders:
            'Apply on moist and puddled soil. Control water normally after applying without submerging seedlings; spray volume is 200 L/ha.',
      ),
    ],
  ),
];
