trigger ChannelTransactionTrigger on Channel_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
