trigger LabelFilterTrigger on Label_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelFilterHandler.handleAfterDelete(Trigger.old);
    }
}
