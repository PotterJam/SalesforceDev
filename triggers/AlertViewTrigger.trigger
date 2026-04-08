trigger AlertViewTrigger on Alert_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertViewHandler.handleAfterDelete(Trigger.old);
    }
}
