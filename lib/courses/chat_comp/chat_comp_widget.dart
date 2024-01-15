import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/courses/homework_send_info/homework_send_info_widget.dart';
import '/courses/homework_success_info/homework_success_info_widget.dart';
import '/courses/message/message_widget.dart';
import '/courses/send_homework_mobile/send_homework_mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_comp_model.dart';
export 'chat_comp_model.dart';

class ChatCompWidget extends StatefulWidget {
  const ChatCompWidget({
    Key? key,
    required this.currentChat,
    this.onlyPhoto,
    required this.currentLesson,
  }) : super(key: key);

  final ChatsRecord? currentChat;
  final bool? onlyPhoto;
  final LessonsRecord? currentLesson;

  @override
  _ChatCompWidgetState createState() => _ChatCompWidgetState();
}

class _ChatCompWidgetState extends State<ChatCompWidget> {
  late ChatCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatCompModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<MessageRecord>>(
      stream: queryMessageRecord(
        parent: widget.currentChat?.reference,
        queryBuilder: (messageRecord) =>
            messageRecord.orderBy('date_time', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitRipple(
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 50.0,
              ),
            ),
          );
        }
        List<MessageRecord> containerMessageRecordList = snapshot.data!;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: FutureBuilder<CoursesRecord>(
            future: CoursesRecord.getDocumentOnce(
                widget.currentLesson!.parentReference),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitRipple(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 50.0,
                    ),
                  ),
                );
              }
              final stackCoursesRecord = snapshot.data!;
              return Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final allMessages =
                                  containerMessageRecordList.toList();
                              if (allMessages.isEmpty) {
                                return SendHomeworkMobileWidget();
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                reverse: true,
                                scrollDirection: Axis.vertical,
                                itemCount: allMessages.length,
                                itemBuilder: (context, allMessagesIndex) {
                                  final allMessagesItem =
                                      allMessages[allMessagesIndex];
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        MessageWidget(
                                          key: Key(
                                              'Key228_${allMessagesIndex}_of_${allMessages.length}'),
                                          currentMes: allMessagesItem,
                                        ),
                                        if (!widget.currentChat!.isFinished &&
                                            (widget.currentChat
                                                    ?.lastMessageSentBy ==
                                                currentUserReference) &&
                                            (allMessagesIndex == 0))
                                          HomeworkSendInfoWidget(
                                            key: Key(
                                                'Keylmk_${allMessagesIndex}_of_${allMessages.length}'),
                                          ),
                                        if (widget.currentChat!.isFinished &&
                                            (allMessagesIndex == 0))
                                          HomeworkSuccessInfoWidget(
                                            key: Key(
                                                'Key35g_${allMessagesIndex}_of_${allMessages.length}'),
                                          ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!widget.onlyPhoto! && !widget.currentChat!.isFinished)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  maxWidth: 1024.00,
                                  maxHeight: 1024.00,
                                  imageQuality: 95,
                                  allowPhoto: true,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(
                                      () => _model.isDataUploading1 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Загружаем файл...',
                                      showLoading: true,
                                    );
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();

                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    _model.isDataUploading1 = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile1 =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl1 =
                                          downloadUrls.first;
                                    });
                                    showUploadMessage(context, 'Успешно!');
                                  } else {
                                    setState(() {});
                                    showUploadMessage(
                                        context, 'Ошибка загрузки файла');
                                    return;
                                  }
                                }

                                if (_model.uploadedFileUrl1 != null &&
                                    _model.uploadedFileUrl1 != '') {
                                  await MessageRecord.createDoc(
                                          widget.currentChat!.reference)
                                      .set(createMessageRecordData(
                                    user: currentUserReference,
                                    image: _model.uploadedFileUrl1,
                                    dateTime: getCurrentTimestamp,
                                  ));

                                  await widget.currentChat!.reference.update({
                                    ...createChatsRecordData(
                                      lastMessage: 'Изображение',
                                      lastMessageTime: getCurrentTimestamp,
                                      lastMessageSentBy: currentUserReference,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'last_message_seen_by':
                                            functions.userReferenceToList(
                                                currentUserReference!),
                                      },
                                    ),
                                  });
                                  _model.updatePage(() {});
                                }
                              },
                              child: Container(
                                width: 42.0,
                                height: 42.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent3,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  FFIcons.kphoto,
                                  color: FlutterFlowTheme.of(context).accent1,
                                  size: 18.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: Container(
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent4,
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  child: Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController',
                                          Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintText: 'Написать преподавателю',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                color: Color(0xFF8A8A8E),
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
                                              ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        maxLines: null,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (_model.textController.text != null &&
                                    _model.textController.text != '') {
                                  await MessageRecord.createDoc(
                                          widget.currentChat!.reference)
                                      .set(createMessageRecordData(
                                    user: currentUserReference,
                                    message: _model.textController.text,
                                    dateTime: getCurrentTimestamp,
                                  ));

                                  await widget.currentChat!.reference.update({
                                    ...createChatsRecordData(
                                      lastMessage: _model.textController.text,
                                      lastMessageTime: getCurrentTimestamp,
                                      lastMessageSentBy: currentUserReference,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'last_message_seen_by':
                                            functions.userReferenceToList(
                                                currentUserReference!),
                                      },
                                    ),
                                  });
                                  setState(() {
                                    _model.textController?.clear();
                                  });
                                  _model.updatePage(() {});
                                }
                              },
                              child: Container(
                                width: 42.0,
                                height: 42.0,
                                decoration: BoxDecoration(
                                  color: _model.textController.text != null &&
                                          _model.textController.text != ''
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context).accent3,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  FFIcons.kupRight,
                                  color: _model.textController.text != null &&
                                          _model.textController.text != ''
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context).accent1,
                                  size: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (widget.onlyPhoto! && !widget.currentChat!.isFinished)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              maxWidth: 1024.00,
                              maxHeight: 1024.00,
                              imageQuality: 95,
                              allowPhoto: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading2 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Загружаем файл...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading2 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile2 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl2 = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Успешно!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Ошибка загрузки файла');
                                return;
                              }
                            }

                            if (_model.uploadedFileUrl2 != null &&
                                _model.uploadedFileUrl2 != '') {
                              await MessageRecord.createDoc(
                                      widget.currentChat!.reference)
                                  .set(createMessageRecordData(
                                user: currentUserReference,
                                image: _model.uploadedFileUrl2,
                                dateTime: getCurrentTimestamp,
                              ));

                              await widget.currentChat!.reference.update({
                                ...createChatsRecordData(
                                  lastMessage: 'Изображение',
                                  lastMessageTime: getCurrentTimestamp,
                                  lastMessageSentBy: currentUserReference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'last_message_seen_by':
                                        functions.userReferenceToList(
                                            currentUserReference!),
                                  },
                                ),
                              });
                              _model.updatePage(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Фото не выбрано',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryText,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FFIcons.kphoto,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Прикрепить фото',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (widget.currentChat?.isFinished ?? true)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.tariff = await TariffsRecord.getDocumentOnce(
                                currentUserDocument!.rlRecentlyTariff!);

                            context.goNamed(
                              'Modules',
                              queryParameters: {
                                'currentCourse': serializeParam(
                                  stackCoursesRecord,
                                  ParamType.Document,
                                ),
                                'tariffRef': serializeParam(
                                  currentUserDocument?.rlRecentlyTariff,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'currentCourse': stackCoursesRecord,
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );

                            setState(() {});
                          },
                          child: Container(
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent4,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Закрыть',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
