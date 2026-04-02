trigger ChannelHandlerTrigger on Channel_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
