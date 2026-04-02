trigger LabelAdapterTrigger on Label_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
