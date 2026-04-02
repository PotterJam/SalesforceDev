trigger LabelDetailTrigger on Label_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelDetailHandler.handleAfterDelete(Trigger.old);
    }
}
