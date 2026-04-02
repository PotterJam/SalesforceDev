trigger FloorViewTrigger on Floor_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorViewHandler.handleAfterDelete(Trigger.old);
    }
}
