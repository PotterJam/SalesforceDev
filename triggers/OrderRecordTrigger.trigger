trigger OrderRecordTrigger on Order_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderRecordHandler.handleAfterDelete(Trigger.old);
    }
}
