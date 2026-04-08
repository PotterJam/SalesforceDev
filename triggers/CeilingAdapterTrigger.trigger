trigger CeilingAdapterTrigger on Ceiling_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
