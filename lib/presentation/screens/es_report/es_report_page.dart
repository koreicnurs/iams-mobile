import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iamc_flutter/presentation/theme/app_colors.dart';
import 'package:iamc_flutter/presentation/theme/app_fonts.dart';
import 'package:iamc_flutter/presentation/widgets/main_app_bar.dart';
import 'package:iamc_flutter/presentation/widgets/main_drawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class EsReportPage extends StatelessWidget {
  EsReportPage({super.key});

  final ImagePicker _picker = ImagePicker();

  Future<void> _handleGallery() async {
    final permissionStatus = await Permission.photos.request();
    if (permissionStatus.isGranted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // Действия с выбранным файлом
      }
    } else {
      // Обработка отказа в доступе
    }
  }

  Future<void> _handleCamera() async {
    final permissionStatus = await Permission.camera.request();
    if (permissionStatus.isGranted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        // Действия с выбранным файлом
      }
    } else {
      // Обработка отказа в доступе
    }
  }

  Future<void> _handleAudio() async {
    final permissionStatus = await Permission.microphone.request();
    if (permissionStatus.isGranted) {
      // Запуск записи аудио
    } else {
      // Обработка отказа в доступе
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const MainAppBar(),
        drawer: const MainDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Первый блок
              const SizedBox(height: 35),
              Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(60, 13, 13, 19),
                          color: AppColors.redBellBG,
                          child: SvgPicture.asset(
                            'assets/svg/es_bell.svg',
                            width: 36,
                            height: 40,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Создание сообщения о происшествии',
                                softWrap: true,
                                style: AppFonts.s18w700
                                    .copyWith(color: AppColors.black)),
                            const SizedBox(width: 10),
                            Text(
                              'Заполните форму о происшествии',
                              softWrap: true,
                              style: AppFonts.s14norm
                                  .copyWith(color: AppColors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Местоположение проишествия',
                        style:
                            AppFonts.s18w700.copyWith(color: AppColors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 45,
                          color: AppColors.redBellBG,
                        ),
                        const SizedBox(width: 25),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Кыргызстан',
                                  softWrap: true,
                                  style: AppFonts.s14norm
                                      .copyWith(color: AppColors.blueblack)),
                              const SizedBox(width: 10),
                              Text(
                                'Город Бишкек мкр-н Аламедин-1',
                                softWrap: true,
                                style: AppFonts.s14norm
                                    .copyWith(color: AppColors.blueblack),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),

              // Второй блок
              const IncidentForm(),

              // Третий блок
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Загрузить медиа',
                      style: AppFonts.s18w700.copyWith(color: AppColors.black),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // Изменение здесь
                      children: [
                        EsIcons(
                          text: 'Галерея',
                          icon: Icon(
                            Icons.photo_camera_back_outlined,
                            size: 40,
                            color: AppColors.blueIcon,
                          ),
                          prem: _handleGallery,
                        ),
                        const SizedBox(width: 20),
                        EsIcons(
                          text: 'Камера',
                          icon: Icon(
                            Icons.photo_camera,
                            size: 40,
                            color: AppColors.blueIcon,
                          ),
                          prem: _handleCamera,
                        ),
                        const SizedBox(width: 20),
                        EsIcons(
                          text: 'Аудио',
                          icon: Icon(
                            Icons.mic_none_outlined,
                            size: 40,
                            color: AppColors.blueIcon,
                          ),
                          prem: _handleAudio,
                        ),
                        const SizedBox(width: 20),
                        CircleAvatar(
                          backgroundColor: AppColors.redArrow,
                          radius: 40, // Размер круга (радиус)
                          child: IconButton(
                            icon: const Icon(Icons.send_outlined, size: 40),
                            color: Colors.white, // Цвет иконки
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class EsIcons extends StatelessWidget {
  const EsIcons({
    super.key,
    required this.text,
    required this.icon,
    required this.prem,
  });

  final String text;
  final Icon icon;
  final Future<void> Function() prem; // Изменил тип на Future<void> Function()

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: icon,
          onPressed: () async {
            try {
              await prem(); // Выполнение асинхронного метода
            } catch (e) {
              // Обработка ошибок, если что-то пошло не так
              print('Error: $e');
              // Вы можете показать сообщение пользователю или сделать что-то другое
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Не удалось выполнить действие')),
              );
            }
          },
        ),
        Text(
          text,
          style: AppFonts.s14norm.copyWith(color: AppColors.black),
        )
      ],
    );
  }
}

class IncidentForm extends StatefulWidget {
  const IncidentForm({super.key});

  @override
  _IncidentFormState createState() => _IncidentFormState();
}

class _IncidentFormState extends State<IncidentForm> {
  String _selectedIncident = 'Другое';
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Выберите тип происшествия',
            style: AppFonts.s18w700.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedIncident,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down_sharp),
                style: AppFonts.s14norm.copyWith(color: AppColors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedIncident = newValue!;
                  });
                },
                items: <String>['Другое', 'Наводнение', 'Сель', 'Пожар']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: AppFonts.s14norm.copyWith(color: AppColors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 26.5),
          Text(
            'Добавьте описание',
            style: AppFonts.s18w700.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 180, // Высота TextField
            child: InputDecorator(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              child: TextField(
                expands: true,
                controller: _descriptionController,
                maxLines: null,
                maxLength: 200,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Введите текст описания',
                  contentPadding: EdgeInsets.all(5), // Padding внутри TextField
                ),
                style: AppFonts.s16norm
                    .copyWith(color: AppColors.black), // Красный текст
              ),
            ),
          ),
          const SizedBox(height: 35),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: FloatingActionButton(
          //     onPressed: () {
          //       // Action when button is pressed
          //     },
          //     child: Icon(Icons.send),
          //   ),
          // ),
        ],
      ),
    );
  }
}
