trigger AlertTaskTrigger on Alert_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertTaskHandler.handleAfterDelete(Trigger.old);
    }
}
