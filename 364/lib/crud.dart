// Egal für welche Datenbank wir uns entscheiden, unsere App braucht diese beiden Methoden, um Nachrichten zu senden und zu empfangen.
/*
abstract class DatabaseRepository {
  void sendMessage(String message);
  List<ChatMessage> getMessages();
}
*/

abstract class DatabaseRepository {
  // CREATE
  void createMessage(ChatMessage message);

  // READ
  List<ChatMessage> readMessages();

  // UPDATE
  void updateMessage(String messageId, ChatMessage updatedMessage);

  // DELETE
  void deleteMessage(String messageId);
}