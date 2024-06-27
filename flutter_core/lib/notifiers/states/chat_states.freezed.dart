// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<DyteChatMessage> messages) onChatUpdates,
    required TResult Function(DyteChatMessage message) onNewChatMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<DyteChatMessage> messages)? onChatUpdates,
    TResult? Function(DyteChatMessage message)? onNewChatMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<DyteChatMessage> messages)? onChatUpdates,
    TResult Function(DyteChatMessage message)? onNewChatMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatStates value) initial,
    required TResult Function(_ChatStatesOnChatUpdates value) onChatUpdates,
    required TResult Function(_ChatStatesOnNewChatMessage value)
        onNewChatMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatStates value)? initial,
    TResult? Function(_ChatStatesOnChatUpdates value)? onChatUpdates,
    TResult? Function(_ChatStatesOnNewChatMessage value)? onNewChatMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatStates value)? initial,
    TResult Function(_ChatStatesOnChatUpdates value)? onChatUpdates,
    TResult Function(_ChatStatesOnNewChatMessage value)? onNewChatMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStatesCopyWith<$Res> {
  factory $ChatStatesCopyWith(
          ChatStates value, $Res Function(ChatStates) then) =
      _$ChatStatesCopyWithImpl<$Res, ChatStates>;
}

/// @nodoc
class _$ChatStatesCopyWithImpl<$Res, $Val extends ChatStates>
    implements $ChatStatesCopyWith<$Res> {
  _$ChatStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChatStatesImplCopyWith<$Res> {
  factory _$$ChatStatesImplCopyWith(
          _$ChatStatesImpl value, $Res Function(_$ChatStatesImpl) then) =
      __$$ChatStatesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatStatesImplCopyWithImpl<$Res>
    extends _$ChatStatesCopyWithImpl<$Res, _$ChatStatesImpl>
    implements _$$ChatStatesImplCopyWith<$Res> {
  __$$ChatStatesImplCopyWithImpl(
      _$ChatStatesImpl _value, $Res Function(_$ChatStatesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChatStatesImpl implements _ChatStates {
  const _$ChatStatesImpl();

  @override
  String toString() {
    return 'ChatStates.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatStatesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<DyteChatMessage> messages) onChatUpdates,
    required TResult Function(DyteChatMessage message) onNewChatMessage,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<DyteChatMessage> messages)? onChatUpdates,
    TResult? Function(DyteChatMessage message)? onNewChatMessage,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<DyteChatMessage> messages)? onChatUpdates,
    TResult Function(DyteChatMessage message)? onNewChatMessage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatStates value) initial,
    required TResult Function(_ChatStatesOnChatUpdates value) onChatUpdates,
    required TResult Function(_ChatStatesOnNewChatMessage value)
        onNewChatMessage,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatStates value)? initial,
    TResult? Function(_ChatStatesOnChatUpdates value)? onChatUpdates,
    TResult? Function(_ChatStatesOnNewChatMessage value)? onNewChatMessage,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatStates value)? initial,
    TResult Function(_ChatStatesOnChatUpdates value)? onChatUpdates,
    TResult Function(_ChatStatesOnNewChatMessage value)? onNewChatMessage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ChatStates implements ChatStates {
  const factory _ChatStates() = _$ChatStatesImpl;
}

/// @nodoc
abstract class _$$ChatStatesOnChatUpdatesImplCopyWith<$Res> {
  factory _$$ChatStatesOnChatUpdatesImplCopyWith(
          _$ChatStatesOnChatUpdatesImpl value,
          $Res Function(_$ChatStatesOnChatUpdatesImpl) then) =
      __$$ChatStatesOnChatUpdatesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DyteChatMessage> messages});
}

/// @nodoc
class __$$ChatStatesOnChatUpdatesImplCopyWithImpl<$Res>
    extends _$ChatStatesCopyWithImpl<$Res, _$ChatStatesOnChatUpdatesImpl>
    implements _$$ChatStatesOnChatUpdatesImplCopyWith<$Res> {
  __$$ChatStatesOnChatUpdatesImplCopyWithImpl(
      _$ChatStatesOnChatUpdatesImpl _value,
      $Res Function(_$ChatStatesOnChatUpdatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$ChatStatesOnChatUpdatesImpl(
      null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<DyteChatMessage>,
    ));
  }
}

/// @nodoc

class _$ChatStatesOnChatUpdatesImpl implements _ChatStatesOnChatUpdates {
  const _$ChatStatesOnChatUpdatesImpl(final List<DyteChatMessage> messages)
      : _messages = messages;

  final List<DyteChatMessage> _messages;
  @override
  List<DyteChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatStates.onChatUpdates(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStatesOnChatUpdatesImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStatesOnChatUpdatesImplCopyWith<_$ChatStatesOnChatUpdatesImpl>
      get copyWith => __$$ChatStatesOnChatUpdatesImplCopyWithImpl<
          _$ChatStatesOnChatUpdatesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<DyteChatMessage> messages) onChatUpdates,
    required TResult Function(DyteChatMessage message) onNewChatMessage,
  }) {
    return onChatUpdates(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<DyteChatMessage> messages)? onChatUpdates,
    TResult? Function(DyteChatMessage message)? onNewChatMessage,
  }) {
    return onChatUpdates?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<DyteChatMessage> messages)? onChatUpdates,
    TResult Function(DyteChatMessage message)? onNewChatMessage,
    required TResult orElse(),
  }) {
    if (onChatUpdates != null) {
      return onChatUpdates(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatStates value) initial,
    required TResult Function(_ChatStatesOnChatUpdates value) onChatUpdates,
    required TResult Function(_ChatStatesOnNewChatMessage value)
        onNewChatMessage,
  }) {
    return onChatUpdates(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatStates value)? initial,
    TResult? Function(_ChatStatesOnChatUpdates value)? onChatUpdates,
    TResult? Function(_ChatStatesOnNewChatMessage value)? onNewChatMessage,
  }) {
    return onChatUpdates?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatStates value)? initial,
    TResult Function(_ChatStatesOnChatUpdates value)? onChatUpdates,
    TResult Function(_ChatStatesOnNewChatMessage value)? onNewChatMessage,
    required TResult orElse(),
  }) {
    if (onChatUpdates != null) {
      return onChatUpdates(this);
    }
    return orElse();
  }
}

abstract class _ChatStatesOnChatUpdates implements ChatStates {
  const factory _ChatStatesOnChatUpdates(final List<DyteChatMessage> messages) =
      _$ChatStatesOnChatUpdatesImpl;

  List<DyteChatMessage> get messages;
  @JsonKey(ignore: true)
  _$$ChatStatesOnChatUpdatesImplCopyWith<_$ChatStatesOnChatUpdatesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatStatesOnNewChatMessageImplCopyWith<$Res> {
  factory _$$ChatStatesOnNewChatMessageImplCopyWith(
          _$ChatStatesOnNewChatMessageImpl value,
          $Res Function(_$ChatStatesOnNewChatMessageImpl) then) =
      __$$ChatStatesOnNewChatMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DyteChatMessage message});
}

/// @nodoc
class __$$ChatStatesOnNewChatMessageImplCopyWithImpl<$Res>
    extends _$ChatStatesCopyWithImpl<$Res, _$ChatStatesOnNewChatMessageImpl>
    implements _$$ChatStatesOnNewChatMessageImplCopyWith<$Res> {
  __$$ChatStatesOnNewChatMessageImplCopyWithImpl(
      _$ChatStatesOnNewChatMessageImpl _value,
      $Res Function(_$ChatStatesOnNewChatMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ChatStatesOnNewChatMessageImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as DyteChatMessage,
    ));
  }
}

/// @nodoc

class _$ChatStatesOnNewChatMessageImpl implements _ChatStatesOnNewChatMessage {
  const _$ChatStatesOnNewChatMessageImpl(this.message);

  @override
  final DyteChatMessage message;

  @override
  String toString() {
    return 'ChatStates.onNewChatMessage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStatesOnNewChatMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStatesOnNewChatMessageImplCopyWith<_$ChatStatesOnNewChatMessageImpl>
      get copyWith => __$$ChatStatesOnNewChatMessageImplCopyWithImpl<
          _$ChatStatesOnNewChatMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<DyteChatMessage> messages) onChatUpdates,
    required TResult Function(DyteChatMessage message) onNewChatMessage,
  }) {
    return onNewChatMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<DyteChatMessage> messages)? onChatUpdates,
    TResult? Function(DyteChatMessage message)? onNewChatMessage,
  }) {
    return onNewChatMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<DyteChatMessage> messages)? onChatUpdates,
    TResult Function(DyteChatMessage message)? onNewChatMessage,
    required TResult orElse(),
  }) {
    if (onNewChatMessage != null) {
      return onNewChatMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatStates value) initial,
    required TResult Function(_ChatStatesOnChatUpdates value) onChatUpdates,
    required TResult Function(_ChatStatesOnNewChatMessage value)
        onNewChatMessage,
  }) {
    return onNewChatMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatStates value)? initial,
    TResult? Function(_ChatStatesOnChatUpdates value)? onChatUpdates,
    TResult? Function(_ChatStatesOnNewChatMessage value)? onNewChatMessage,
  }) {
    return onNewChatMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatStates value)? initial,
    TResult Function(_ChatStatesOnChatUpdates value)? onChatUpdates,
    TResult Function(_ChatStatesOnNewChatMessage value)? onNewChatMessage,
    required TResult orElse(),
  }) {
    if (onNewChatMessage != null) {
      return onNewChatMessage(this);
    }
    return orElse();
  }
}

abstract class _ChatStatesOnNewChatMessage implements ChatStates {
  const factory _ChatStatesOnNewChatMessage(final DyteChatMessage message) =
      _$ChatStatesOnNewChatMessageImpl;

  DyteChatMessage get message;
  @JsonKey(ignore: true)
  _$$ChatStatesOnNewChatMessageImplCopyWith<_$ChatStatesOnNewChatMessageImpl>
      get copyWith => throw _privateConstructorUsedError;
}
