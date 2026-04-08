trigger AlertNodeTrigger on Alert_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertNodeHandler.handleAfterDelete(Trigger.old);
    }
}
