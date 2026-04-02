trigger QualityAdapterTrigger on Quality_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
