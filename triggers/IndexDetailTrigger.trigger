trigger IndexDetailTrigger on Index_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexDetailHandler.handleAfterDelete(Trigger.old);
    }
}
