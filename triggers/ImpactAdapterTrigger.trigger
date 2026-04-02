trigger ImpactAdapterTrigger on Impact_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
