trigger ProjectDetailTrigger on Project_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectDetailHandler.handleAfterDelete(Trigger.old);
    }
}
