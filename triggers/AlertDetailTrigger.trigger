trigger AlertDetailTrigger on Alert_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertDetailHandler.handleAfterDelete(Trigger.old);
    }
}
