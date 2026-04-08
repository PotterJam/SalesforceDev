trigger MarketingStreamTrigger on Marketing_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingStreamHandler.handleAfterDelete(Trigger.old);
    }
}
