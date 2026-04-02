trigger AlertServiceTrigger on Alert_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertServiceHandler.handleAfterDelete(Trigger.old);
    }
}
