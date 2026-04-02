trigger CustomerAdapterTrigger on Customer_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
