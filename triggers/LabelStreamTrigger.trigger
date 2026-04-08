trigger LabelStreamTrigger on Label_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelStreamHandler.handleAfterDelete(Trigger.old);
    }
}
